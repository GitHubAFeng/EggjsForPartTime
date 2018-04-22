'use strict';

const Controller = require('egg').Controller;

class HomeController extends Controller {
  async hello() {
    this.ctx.body = 'OK';
  }

  async index() {
    this.ctx.body = 'e42c0dd9fe4423e08c95d7fc54559575';
  }
}

module.exports = HomeController;
