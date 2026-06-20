class N8nc < Formula
  desc "CLI for n8n workflow automation"
  homepage "https://github.com/rvben/n8nc"
  version "0.4.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/n8nc/releases/download/v0.4.6/n8nc-v0.4.6-aarch64-apple-darwin.tar.gz"
      sha256 "b8911d24cbf427e9c3a19242c6490c313156a5f6a5a496157b887c564760260d"
    else
      url "https://github.com/rvben/n8nc/releases/download/v0.4.6/n8nc-v0.4.6-x86_64-apple-darwin.tar.gz"
      sha256 "5b2cdb426e7d862194c000250713656a944c7a28e0d5b6f26d4aeb4ed8a8f011"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/n8nc/releases/download/v0.4.6/n8nc-v0.4.6-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c815f69c61c608e30d050a9f0523ba85300df7354e00d646e786a8491f30eb0e"
    else
      url "https://github.com/rvben/n8nc/releases/download/v0.4.6/n8nc-v0.4.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c6f0655be82b144b72ca4c49c2a4c6bf4b295fc9710e7146e53bfa9372f02699"
    end
  end

  def install
    bin.install "n8nc"
  end

  test do
    system "#{bin}/n8nc", "--version"
  end
end
