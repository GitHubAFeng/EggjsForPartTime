'use strict';

const Service = require('egg').Service;
const table_name = 'pt_comments';

class CommentsService extends Service {

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
        const { ctx } = this;
        
        const page_size = data.size;
        const page = data.page;
        const task_id = data.task_id;
        const count_sql = `SELECT COUNT(*) FROM ${table_name} WHERE is_auth=1 AND is_delete=0 AND task_id=${task_id} `;
        const count = await this.app.mysql.query(count_sql);
        const page_total = Math.ceil(count / page_size);
        const page_num = page_total > 0 && page > page_total ? page_total : page;
        const page_start = page_size * (page_num - 1);
        const sql = `SELECT c.detail,c.star_count,c.create_time,u.avatar,u.nickname FROM ${table_name} AS c LEFT JOIN pt_user AS u ON u.id=c.user_id WHERE c.is_auth=1 AND c.is_delete=0 AND c.task_id=${task_id} order by c.create_time desc LIMIT ${page_start},${page_size}`;
        let results = await this.app.mysql.query(sql);
        for (let index = 0; index < results.length; index++) {
            console.log(results[index].create_time);
            
            results[index].create_time = ctx.helper.moment_ago(results[index].create_time);
            
        }
        return results;

    }


}


module.exports = CommentsService;