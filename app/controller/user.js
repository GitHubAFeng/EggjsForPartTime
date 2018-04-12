'use strict';

const jwt = require('jsonwebtoken');
const Controller = require('egg').Controller;
const WXBizDataCrypt = require('../utils/WXBizDataCrypt');

class UserController extends Controller {


    async update() {
        const { ctx, service } = this;
        const avatar = ctx.request.body.avatar;
        const city = ctx.request.body.city;
        const country = ctx.request.body.country;
        const gender = ctx.request.body.gender;
        const nickname = ctx.request.body.nickname;
        const openid = ctx.request.body.openid;

        const data = {
            city,
            avatar,
            gender,
            country,
            nickname
        };

        // this.app.logger.info('openid:' + openid);
        console.log('uid',ctx.locals.uid);
        
        const options = {
            where: {
                openid: openid
            }
        };

        const row = await ctx.service.user.update(data, options);

        ctx.body = { "code": 0, "msg": 'ok', "data": row };

    }


    async token() {
        const { ctx, service, app } = this;

        const code = ctx.query.code;
        if (code == 'undefined') {
            ctx.body = { "code": 1, "msg": 'code为空', "data": '' };
            return;
        }

        //openid:"oqjZc5UBrVpCA2ugUzVuHtpZ2v4g"

        const appid = this.app.config.appid;
        const appsecret = this.app.config.appsecret;

        const wxurl = `https://api.weixin.qq.com/sns/jscode2session?appid=${appid}&secret=${appsecret}&js_code=${code}&grant_type=authorization_code`;
        const result = await ctx.curl(wxurl, {
            // 自动解析 JSON response
            dataType: 'json',
            // 3 秒超时
            timeout: 3000,
        });

        const session_key = result.data.session_key; //会话密钥
        const openid = result.data.openid; //openid
        await app.redis.set('session_key', session_key);
        let uid = 0;

        const user = await ctx.service.user.find_by_openid(openid);
        if (user) {
            uid = user.id;
        } else {
            //注册用户
            const data = {
                openid: openid,
            }
            uid = await ctx.service.user.insert(data);
        }

        const secretOrPrivateKey = this.app.config.secret_private_key; // 密钥
        const secretOrPrivateSign = this.app.config.secret_private_sign; // 签名
        const time_out = this.app.config.secret_private_time;  //token有效时间，24小时后过期
        const auth_data = { "uid": uid, "sign": secretOrPrivateSign };
        const content = { key: auth_data }; // 要生成token的加密信息

        const token = jwt.sign(content, secretOrPrivateKey, { expiresIn: time_out }); // 创建token
        // console.log(token);
        // const test = await app.redis.get('session_key');
        // console.log("test:",test);


        ctx.body = { "code": 0, "msg": 'ok', "data": token };
    }

    //获取微信用户部分加密的信息，没什么用
    async decode_userinfo() {
        const { ctx, service, app } = this;
        const iv = ctx.query.iv;
        const encryptedData = ctx.query.encryptedData;
        const appid = this.app.config.appid;
        const appsecret = this.app.config.appsecret;
        const sessionKey = await app.redis.get('session_key');
        // console.log("iv:",iv);
        // console.log("encryptedData:",encryptedData);
        const pc = new WXBizDataCrypt(appid, sessionKey);
        const data = pc.decryptData(encryptedData, iv);
        ctx.body = { "code": 0, "msg": 'ok', "data": data };

    }

}

module.exports = UserController;
