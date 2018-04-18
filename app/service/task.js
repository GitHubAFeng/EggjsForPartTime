'use strict';

const Service = require('egg').Service;
const table_name = 'pt_task';

class TaskService extends Service {

    async find(data) {
        const result = await this.app.mysql.get(table_name, { id: data });
        return result;
    }


    async insert(data) {
        const timestamp = this.ctx.helper.moment_timestamp();    // 当前时间戳
        const obj = Object.assign({
            create_time: timestamp
        }, data);
        const { insertId } = await this.app.mysql.insert(table_name, obj);
        return insertId;
    }

    async getList(data) {
        const page_size = data.size;
        const page = data.page;
        const count_sql = `SELECT COUNT(*) FROM ${table_name} WHERE is_auth=1 AND is_delete=0 `;
        const count = await this.app.mysql.query(count_sql);
        const page_total = Math.ceil(count / page_size);
        const page_num = page_total > 0 && page > page_total ? page_total : page;
        const page_start = page_size * (page_num - 1);
        const sql = `SELECT * FROM ${table_name} WHERE is_auth=1 AND is_delete=0 order by create_time desc LIMIT ${page_start},${page_size}`;
        const results = await this.app.mysql.query(sql);
        // console.log('sql   = ', sql);
        return results;
    }



}


module.exports = TaskService;