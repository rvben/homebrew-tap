class N8nc < Formula
  desc "CLI for n8n workflow automation"
  homepage "https://github.com/rvben/n8nc"
  version "0.4.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/n8nc/releases/download/v0.4.3/n8nc-v0.4.3-aarch64-apple-darwin.tar.gz"
      sha256 "46c2d19d8252c939e093b903f3908f6bd1529f283e7055a4a4815d61b2f4f857"
    else
      url "https://github.com/rvben/n8nc/releases/download/v0.4.3/n8nc-v0.4.3-x86_64-apple-darwin.tar.gz"
      sha256 "71bd421b4d1c8d6459d581319178d4049c1ea986272cbc80bd64a99edc1277d7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/n8nc/releases/download/v0.4.3/n8nc-v0.4.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8728bd1688c302c7262a78316d1b52c0d927a7129927b6adf4a83495de933f9d"
    else
      url "https://github.com/rvben/n8nc/releases/download/v0.4.3/n8nc-v0.4.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9b2e4ee15d51f61de23a0bf0181bd3aa75f2441e5b622a9a3a3e2d56b1c2680f"
    end
  end

  def install
    bin.install "n8nc"
  end

  test do
    system "#{bin}/n8nc", "--version"
  end
end
