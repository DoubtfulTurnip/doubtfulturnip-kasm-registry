/** @type {import('next').NextConfig} */

const nextConfig = {
  env: {
    name: 'DoubtfulTurnip',
    description: 'Security, OSINT, and forensics workspaces for Kasm Workspaces 1.19.x.',
    icon: 'https://avatars.githubusercontent.com/u/23531986?v=4',
    listUrl: 'https://doubtfulturnip.github.io/doubtfulturnip-kasm-registry/',
    contactUrl: 'https://github.com/DoubtfulTurnip/doubtfulturnip-kasm-registry/issues',
  },
  reactStrictMode: true,
  output: 'export',
  swcMinify: true,
  basePath: '/doubtfulturnip-kasm-registry/1.1',
  trailingSlash: true,
  images: {
    unoptimized: true,
  }
}

module.exports = nextConfig
