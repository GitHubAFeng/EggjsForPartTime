'use strict';

const path = require('path');
const fs = require('fs');
const SWF = require('sensitive-word-filter');//敏感词过滤 cnpm install sensitive-word-filter --save
const sendToWormhole = require('stream-wormhole'); //需要安装stream-wormhole
const awaitWriteStream = require('await-stream-ready').write; //需要安装await-stream-ready

const Controller = require('egg').Controller;

class CommentsController extends Controller {



    async getlist() {
        const { ctx, service } = this;
        const task_id = ctx.query.task_id;
        const page = ctx.query.page; //当前页码
        const size = ctx.query.size; //每页数据数量
        const result = await ctx.service.comments.getList({ page, size, task_id });
        ctx.body = { "code": 0, "msg": 'ok', "data": result };
    }




    async add() {
        const { ctx, service } = this;
        const user_id = ctx.locals.uid;
        const task_id = ctx.request.body.task_id;
        let detail = ctx.request.body.detail;

        detail = SWF.filter(detail);

        let data = {
            user_id, task_id, detail, is_auth: 1
        }

        // this.app.logger.info('add:' + name);
        let code = 0, msg = 'ok';

        const result = await ctx.service.comments.insert(data);
        if (result == 0) {
            code = 1;
            msg = 'error';
        }

        ctx.body = { "code": 0, "msg": 'ok', "data": result };
    }


}

module.exports = CommentsController;
