import Footer from './Footer'
import { HashScrollSync } from './hash-scroll-sync'
import Header from './Header'

export function Layout({ children }: { children: React.ReactNode }) {
  return (
    <>
      <HashScrollSync />
      <Header />
      {children}
      <Footer />
    </>
  )
}
