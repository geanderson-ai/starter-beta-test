import Head from 'next/head'
import Image from 'next/image'

export default function Home() {
  return `Hello ${process.env.NEXT_PUBLIC_HELLO}`
}
