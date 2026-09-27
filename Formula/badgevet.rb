class Badgevet < Formula
  desc "Find retired and broken status badges in Markdown that link checkers miss"
  homepage "https://github.com/rvben/badgevet"
  version "0.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/badgevet/releases/download/v0.1.2/badgevet-v0.1.2-aarch64-apple-darwin.tar.gz"
      sha256 "d53c90936542af46d11bf2a54728f98265eaee70643b11c0e1084cc90f5c80d9"
    else
      url "https://github.com/rvben/badgevet/releases/download/v0.1.2/badgevet-v0.1.2-x86_64-apple-darwin.tar.gz"
      sha256 "b15975c53ef29692126cc7ddd49455353edd0d208a4ee82c756f02f536d17e99"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/badgevet/releases/download/v0.1.2/badgevet-v0.1.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "71b42c4d9a2521c730bda4dc377df266103aca330ee30ae4c6bc0abb3e71403a"
    else
      url "https://github.com/rvben/badgevet/releases/download/v0.1.2/badgevet-v0.1.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3ff03da8452b1c402179f20094d13ed4deeb55342b1ad95c1e0595dc4e1f066a"
    end
  end

  def install
    bin.install "badgevet"
  end

  test do
    system "#{bin}/badgevet", "--version"
  end
end
