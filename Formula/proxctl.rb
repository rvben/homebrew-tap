class Proxctl < Formula
  desc "CLI for Proxmox VE"
  homepage "https://github.com/rvben/proxctl"
  version "0.2.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/proxctl/releases/download/v0.2.5/proxctl-v0.2.5-aarch64-apple-darwin.tar.gz"
      sha256 "58299b2f40af3e732861d1712e1d8c0d73c1222154fd2ec983ce92f4aedd0a7d"
    else
      url "https://github.com/rvben/proxctl/releases/download/v0.2.5/proxctl-v0.2.5-x86_64-apple-darwin.tar.gz"
      sha256 "2b551e4cfd0532c640134d8389d456a8130ed89d1ff807fdee7833dcb3cbd26e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/proxctl/releases/download/v0.2.5/proxctl-v0.2.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "689e5abd835b398b280f949a1cbca12db161757b6d543742c0ae7924d8e6c0db"
    else
      url "https://github.com/rvben/proxctl/releases/download/v0.2.5/proxctl-v0.2.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "04cbf8c541698f62e7814928e06055fa80ad9ea7f909cf347a73a3c91774375f"
    end
  end

  def install
    bin.install "proxctl"
  end

  test do
    system "#{bin}/proxctl", "--version"
  end
end
