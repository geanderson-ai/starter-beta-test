/** @type {import('next').NextConfig} */
require('dotenv-vault').config()
console.log(process.env)

const nextConfig = {
  reactStrictMode: true,
  swcMinify: true,
}

module.exports = nextConfig
