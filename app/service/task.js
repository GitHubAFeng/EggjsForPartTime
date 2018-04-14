'use strict';

const Service = require('egg').Service;
const table_name = 'pt_task';

class TaskService extends Service {

    async find(data) {
        const result = await this.app.mysql.get(table_name, { id: data });
        return result;
    }


    async insert(data) {
        const { insertId } = await this.app.mysql.insert(table_name, data);
        return insertId;
    }

    async getList(data) {
        const sql = `SELECT * FROM ${table_name} WHERE is_auth=1 AND is_delete=0 `;
        const results = await this.app.mysql.query(sql);
        return results;
    }



}


module.exports = TaskService;