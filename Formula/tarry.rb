class Tarry < Formula
  desc "Block until a condition holds, then print one compact verdict"
  homepage "https://github.com/rvben/tarry"
  version "0.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/tarry/releases/download/v0.1.2/tarry-v0.1.2-aarch64-apple-darwin.tar.gz"
      sha256 "e89f21520472aaa6328098145b9a11321fd85ce1fcacac77b5b9fdcaacac1598"
    else
      url "https://github.com/rvben/tarry/releases/download/v0.1.2/tarry-v0.1.2-x86_64-apple-darwin.tar.gz"
      sha256 "63134d62bfb17a3d87e70520ebffbcf719c1175388d98fed291c3b62834723a0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/tarry/releases/download/v0.1.2/tarry-v0.1.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "883a6e53f39fac92e963c74995ea4604bec078942284c72a6fa262b253892703"
    else
      url "https://github.com/rvben/tarry/releases/download/v0.1.2/tarry-v0.1.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "77b4f70f45b321c2e0ff004b1070017277d5c2e91af39c69e054a5562983e4eb"
    end
  end

  def install
    bin.install "tarry"
  end

  test do
    system "#{bin}/tarry", "--version"
  end
end
