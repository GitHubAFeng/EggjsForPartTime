'use strict';

const path = require('path');
const fs = require('fs');
const sendToWormhole = require('stream-wormhole'); //需要安装stream-wormhole
const awaitWriteStream = require('await-stream-ready').write; //需要安装await-stream-ready

const Controller = require('egg').Controller;

class TaskController extends Controller {


    async getdetail() {
        const { ctx, service } = this;
        const id = ctx.query.id;

        const { detail, start_time, end_time, sex, phone, name, user_avatar, title, image, wechat } = await ctx.service.task.find(id);
        let data = {
            detail,
            start_time: ctx.helper.moment_timestring(start_time, 'YYYY-MM-DD'),
            end_time: ctx.helper.moment_timestring(end_time, 'YYYY-MM-DD'),
            sex, phone, name, user_avatar, title, image, wechat
        }
        ctx.body = { "code": 0, "msg": 'ok', "data": data };
    }

    async getlist() {
        const { ctx, service } = this;
        const page = ctx.query.page; //当前页码
        const size = ctx.query.size; //每页数据数量
        const result = await ctx.service.task.getList({ page, size });
        ctx.body = { "code": 0, "msg": 'ok', "data": result };
    }


    async upload() {
        const { ctx, app } = this;
        const parts = ctx.multipart();
        const site_root = app.config.root;
        // let file_urls = [];  //暂时上传一张
        let file_url = '';
        let stream;
        while ((stream = await parts()) != null) {
            const filename = stream.filename.toLowerCase();
            const target = path.join(this.config.baseDir, 'app/public/images', filename);
            const writeStream = fs.createWriteStream(target);
            // file_urls.push(site_root + '/public/images/' + filename);
            file_url = site_root + '/public/images/' + filename;
            try {
                await awaitWriteStream(stream.pipe(writeStream));
            } catch (err) {
                await sendToWormhole(stream);
                throw err;
            }
        }
        ctx.body = { "code": 0, "msg": 'ok', "data": file_url };
    }

    async add() {
        const { ctx, service } = this;
        const name = ctx.request.body.name;
        const sex = ctx.request.body.sex;
        const phone = ctx.request.body.phone;
        const start = ctx.request.body.start;
        const end = ctx.request.body.end;
        const detail = ctx.request.body.detail;
        const images = ctx.request.body.images;
        const title = ctx.request.body.title;
        const wechat = ctx.request.body.wechat;
        const user_avatar = ctx.request.body.user_avatar;
        const desc = detail.substr(0, 20) + '…';

        const start_timestamp = ctx.helper.moment_timestamp(start);
        const end_timestamp = ctx.helper.moment_timestamp(end);

        let data = {
            name: name,
            sex: sex,
            phone: phone,
            start_time: start_timestamp,
            end_time: end_timestamp,
            detail: detail,
            image: images,
            title,
            user_avatar,
            desc,
            wechat,
            is_auth: 1
        }

        // this.app.logger.info('add:' + name);
        let code = 0, msg = 'ok';

        const result = await ctx.service.task.insert(data);
        if (result == 0) {
            code = 1;
            msg = 'error';
        }

        ctx.body = { "code": 0, "msg": 'ok', "data": result };
    }


}

module.exports = TaskController;
