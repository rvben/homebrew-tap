class YoobiCli < Formula
  desc "Read and browse Yoobi timesheets from the command line"
  homepage "https://github.com/rvben/yoobi-cli"
  version "0.1.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/yoobi-cli/releases/download/v0.1.4/yoobi-cli-v0.1.4-aarch64-apple-darwin.tar.gz"
      sha256 "a229a4f35d81d8ac9de72c60ef2645f013f98ee26f8f40dbe1a458b31e2bafbb"
    else
      url "https://github.com/rvben/yoobi-cli/releases/download/v0.1.4/yoobi-cli-v0.1.4-x86_64-apple-darwin.tar.gz"
      sha256 "1d8d1a79f86cb149d05bfd1e22c67fd17cbd2c34aa1187c50306cbc8237b0137"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/yoobi-cli/releases/download/v0.1.4/yoobi-cli-v0.1.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7dfa53898d5cd70c6e305c2a66773bbfd2e40b59008842a821be1531e6657baa"
    else
      url "https://github.com/rvben/yoobi-cli/releases/download/v0.1.4/yoobi-cli-v0.1.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f707a42823c111c5e598169949c94dc2344611ad3dc4ff292d295d5de4e716f5"
    end
  end

  def install
    bin.install "yoobi-cli"
  end

  test do
    system "#{bin}/yoobi-cli", "--version"
  end
end
