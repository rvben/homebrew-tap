class N8nc < Formula
  desc "CLI for n8n workflow automation"
  homepage "https://github.com/rvben/n8nc"
  version "0.4.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/n8nc/releases/download/v0.4.7/n8nc-v0.4.7-aarch64-apple-darwin.tar.gz"
      sha256 "99daec409fa8cdb57b5c172dea2bdaba726d00295e9b16774bae853e8788904e"
    else
      url "https://github.com/rvben/n8nc/releases/download/v0.4.7/n8nc-v0.4.7-x86_64-apple-darwin.tar.gz"
      sha256 "0390a367d857b635ae10a41719ed19fdbb0ebf981b04b1a084892b043ab3af00"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/n8nc/releases/download/v0.4.7/n8nc-v0.4.7-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ab70ea2ba977225e8d60684ccecbffded9c74529b353f3ea93ee5a099274b7ba"
    else
      url "https://github.com/rvben/n8nc/releases/download/v0.4.7/n8nc-v0.4.7-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "927b198c6af7e27a0353f715a23199527a4dfe9b1f70951d3364d8e66ba5624b"
    end
  end

  def install
    bin.install "n8nc"
  end

  test do
    system "#{bin}/n8nc", "--version"
  end
end
