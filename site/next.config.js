/** @type {import('next').NextConfig} */

const nextConfig = {
  env: {
    name: 'DoubtfulTurnip',
    description: 'The unofficial store for Kasm supported workspaces.',
    icon: 'https://avatars.githubusercontent.com/u/23531986?v=4',
    listUrl: 'https://github.com/DoubtfulTurnip/doubtfulturnip-kasm-registry',
    contactUrl: 'https://github.com/DoubtfulTurnip/doubtfulturnip-kasm-registry',
  },
  reactStrictMode: true,
  swcMinify: true,
  basePath: '/doubtful-kasm-registry/1.1',
  trailingSlash: true,
  images: {
    unoptimized: true,
  }
}

module.exports = nextConfig
