/** @type {import('next').NextConfig} */

const nextConfig = {
  env: {
    name: 'DoubtfulTurnip',
    description: 'The unofficial store for Kasm supported workspaces.',
    icon: '/img/test.jpg',
    listUrl: 'https://github.com/DoubtfulTurnip/doubtfulturnip-kasm-registry',
    contactUrl: 'https://github.com/DoubtfulTurnip/doubtfulturnip-kasm-registry',
    schema: '1.1',
  },
  reactStrictMode: true,
  swcMinify: true,
  basePath: '/doubtfulturnip-kasm-registry/1.1',
  trailingSlash: true,
  images: {
    unoptimized: true,
  }
}

module.exports = nextConfig
