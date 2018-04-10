'use strict';

const Controller = require('egg').Controller;

class TaskController extends Controller {
    async info() {
        const { ctx, service } = this;
        // const userId = ctx.query.id;
        // const user = await ctx.service.user.find(userId);
        // ctx.body = user;

    }

    async add() {
        const { ctx, service } = this;
        const name = ctx.request.body.name;
        const sex = ctx.request.body.sex;
        const phone = ctx.request.body.phone;
        const start = ctx.request.body.start;
        const end = ctx.request.body.end;
        const detail = ctx.request.body.detail;
        const image = ctx.request.body.image;

        let data = {
            name: name,
            sex: sex, phone: phone, 
            start: start, 
            end: end, 
            detail: detail, 
            image: image
        }

        this.app.logger.info('add:'+ data);

        const result = await ctx.service.task.insert(data);

        ctx.body = {"code":0,"msg":'ok',"result":result};
    }


}

module.exports = TaskController;
