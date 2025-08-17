const request = require('supertest');
const app = require('../src/app');

describe('GET /', () => {
  it('responde 200 y el mensaje esperado', async () => {
    const res = await request(app).get('/');
    expect(res.status).toBe(200);
    expect(res.body).toHaveProperty('message', 'Hola Mundo DevOps 👋');
  });
});
