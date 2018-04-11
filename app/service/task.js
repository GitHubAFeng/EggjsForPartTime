'use strict';

const Service = require('egg').Service;
const table_name = 'pt_task';

class TaskService extends Service {

    async find(data) {
        const result = await this.app.mysql.get(table_name, { id: data });
        return result;
    }


    async insert(data) {
        const {insertId} = await this.app.mysql.insert(table_name, data);
        return insertId;
    }


}


module.exports = TaskService;