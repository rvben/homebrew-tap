class Proxctl < Formula
  desc "CLI for Proxmox VE"
  homepage "https://github.com/rvben/proxctl"
  version "0.2.11"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/proxctl/releases/download/v0.2.11/proxctl-v0.2.11-aarch64-apple-darwin.tar.gz"
      sha256 "4c0abc67199f40ef74f868beacf6f37685c43659bfec9f4f8a75f8348130e709"
    else
      url "https://github.com/rvben/proxctl/releases/download/v0.2.11/proxctl-v0.2.11-x86_64-apple-darwin.tar.gz"
      sha256 "55e5c778fc7f8c7f3bc06c7070e60987ccc1885746b6023158a04c341ed5dac9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/proxctl/releases/download/v0.2.11/proxctl-v0.2.11-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "de7b30394c3015897efbb1efd6fce1965b39f99017416fe2665463b9f168578d"
    else
      url "https://github.com/rvben/proxctl/releases/download/v0.2.11/proxctl-v0.2.11-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "37733b40f8e95ff7befc8ab725f287014ef79307713dcec012a17aabdce12c3c"
    end
  end

  def install
    bin.install "proxctl"
  end

  test do
    system "#{bin}/proxctl", "--version"
  end
end
