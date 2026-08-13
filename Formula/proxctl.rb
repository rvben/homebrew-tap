class Proxctl < Formula
  desc "CLI for Proxmox VE"
  homepage "https://github.com/rvben/proxctl"
  version "0.2.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/proxctl/releases/download/v0.2.10/proxctl-v0.2.10-aarch64-apple-darwin.tar.gz"
      sha256 "65d685e6155b9dc96b8f98968631f00f378450c799afcde46a39f16c5417d0b9"
    else
      url "https://github.com/rvben/proxctl/releases/download/v0.2.10/proxctl-v0.2.10-x86_64-apple-darwin.tar.gz"
      sha256 "306b86094bafe92a5b15262c3d3d280dd0a2175035d89e4c288b2ee6bf55fdf0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/proxctl/releases/download/v0.2.10/proxctl-v0.2.10-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "91a9296891aedcffb768e1e3fa612a4e1f021d7bfe52d710526ffc6c485f04fe"
    else
      url "https://github.com/rvben/proxctl/releases/download/v0.2.10/proxctl-v0.2.10-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7ae3bbf78d14b7e5b4f66dac44b63e12288cbe37cca48f5cfe204feba7406226"
    end
  end

  def install
    bin.install "proxctl"
  end

  test do
    system "#{bin}/proxctl", "--version"
  end
end
