'use strict';

const path = require('path');
const fs = require('fs');
const sendToWormhole = require('stream-wormhole'); //需要安装stream-wormhole
const awaitWriteStream = require('await-stream-ready').write; //需要安装await-stream-ready

const Controller = require('egg').Controller;

class TaskController extends Controller {


    async getlist() {
        const { ctx, service } = this;
        const result = await ctx.service.task.getList({});

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
        const user_avatar = ctx.request.body.user_avatar;

        let data = {
            name: name,
            sex: sex,
            phone: phone,
            start_time: start,
            end_time: end,
            detail: detail,
            image: images,
            title,
            user_avatar,
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
