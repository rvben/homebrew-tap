class Proxctl < Formula
  desc "CLI for Proxmox VE"
  homepage "https://github.com/rvben/proxctl"
  version "0.2.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/proxctl/releases/download/v0.2.8/proxctl-v0.2.8-aarch64-apple-darwin.tar.gz"
      sha256 "0e6d20f4f7f02f465c26ff7296269e49013316f313274d0bc070e3e15e05034d"
    else
      url "https://github.com/rvben/proxctl/releases/download/v0.2.8/proxctl-v0.2.8-x86_64-apple-darwin.tar.gz"
      sha256 "6fc25954ee3d1d3b1f6e80944fd5e7a515776e4f23f42b71f7138513641a7680"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/proxctl/releases/download/v0.2.8/proxctl-v0.2.8-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0cc5400518b3740db56f0cfb725f2d6ae0f071107dd8a3a3e7c43911e56800b5"
    else
      url "https://github.com/rvben/proxctl/releases/download/v0.2.8/proxctl-v0.2.8-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "109c9a2d75010e4899ced1f7f2bef2b6da46b4575e07494d840f5dafab538e24"
    end
  end

  def install
    bin.install "proxctl"
  end

  test do
    system "#{bin}/proxctl", "--version"
  end
end
