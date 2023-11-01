import { haibunPlaywrightRunner } from "./runPlaywright.js";

const fastify = require('fastify')({ logger: true })

fastify.get('/status', async (request, reply) => {
  reply.send({ status: 'ok', uptime: process.uptime(), request, reply })
});
fastify.get('/run', async (request, reply) => {
  const res = await haibunPlaywrightRunner({ batch: 0, instance: 0, content: 'go to "https://example.com"\nsee "Example Domain"' });
  reply.send(res);
})

const start = async () => {
  try {
    await fastify.listen({
      port: 3000,
      host: '0.0.0.0',
    })
  } catch (err) {
    fastify.log.error(err)
    process.exit(1)
  }
}
start()
