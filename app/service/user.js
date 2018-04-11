'use strict';

const Service = require('egg').Service;
const table_name = 'pt_user';

class UserService extends Service {

    async find(data) {
        const result = await this.app.mysql.get(table_name, { id: data });
        return result;
    }


    async find_by_openid(data) {
        const result = await this.app.mysql.get(table_name, { openid: data });
        return result;
    }


    async insert(data) {
        const { insertId } = await this.app.mysql.insert(table_name, data);
        return insertId;
    }


    async update(data, options = {}) {
        const { affectedRows  } = await this.app.mysql.update(table_name, data, options);
        return affectedRows ;
    }


}


module.exports = UserService;