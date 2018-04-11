'use strict';

const jwt = require('jsonwebtoken');
const Controller = require('egg').Controller;

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

        this.app.logger.info('openid:' + openid);

        const options = {
            where: {
                openid: openid
            }
        };

        const row = await ctx.service.user.update(data, options);

        ctx.body = { "code": 0, "msg": 'ok', "data": row };

    }


    async token() {
        const { ctx, service } = this;

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

        const user = await ctx.service.user.find_by_openid(openid);
        if (!user) {
            //注册用户
            const data = {
                openid: openid,
            }
            await ctx.service.user.insert(data);
        }
        const token = this.get_token(openid);
        ctx.body = { "code": 0, "msg": 'ok', "data": token };
    }


    async get_token(openid) {
        const content = { key: openid }; // 要生成token的加密信息
        const secretOrPrivateKey = this.app.config.secret_private_key; // 密钥
        const time_out = this.app.config.secret_private_time;  //token有效时间，24小时后过期
        const token = jwt.sign(content, secretOrPrivateKey, { expiresIn: time_out }); // 创建token
        return token;
    }

}

module.exports = UserController;
