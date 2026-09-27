class ZoomCli < Formula
  desc "CLI for Zoom"
  homepage "https://github.com/rvben/zoom-cli"
  version "0.2.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/zoom-cli/releases/download/v0.2.9/zoom-cli-v0.2.9-aarch64-apple-darwin.tar.gz"
      sha256 "cfa80d6e7d5c99e02ac5b1778b58be7157d49c98a091460c7276d7b4d42741ef"
    else
      url "https://github.com/rvben/zoom-cli/releases/download/v0.2.9/zoom-cli-v0.2.9-x86_64-apple-darwin.tar.gz"
      sha256 "3f5cc9063e3a18c8d55bf5826360e8966b7dc48a019a321211ac6f7c19d8ca78"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/zoom-cli/releases/download/v0.2.9/zoom-cli-v0.2.9-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3ce2f52e1ee716823852fe9e27525b11226444ba0fb155b09279eb5f1b9e1598"
    else
      url "https://github.com/rvben/zoom-cli/releases/download/v0.2.9/zoom-cli-v0.2.9-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6c74c5f647a9be0bf5c6942c52c375a0785291151649e395675c9a9fadddc038"
    end
  end

  def install
    bin.install "zoom"
  end

  test do
    system "#{bin}/zoom", "--version"
  end
end
