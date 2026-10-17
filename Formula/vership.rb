class Vership < Formula
  desc "Multi-target release orchestrator"
  homepage "https://github.com/rvben/vership"
  version "0.5.29"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/vership/releases/download/v0.5.29/vership-v0.5.29-aarch64-apple-darwin.tar.gz"
      sha256 "7daa0f821b405adbd5386e385fccd378f061e5cf0bc4aee8ea6542fd116a4774"
    else
      url "https://github.com/rvben/vership/releases/download/v0.5.29/vership-v0.5.29-x86_64-apple-darwin.tar.gz"
      sha256 "fb1c00b261784c5bd92c89aff33d2da21c9f0b502ecafe85198bea969ad9c3fa"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/vership/releases/download/v0.5.29/vership-v0.5.29-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "55245c5b9e7d35b18adad609d94c97487c85ef25a3c05ef59a424d98ee1020c1"
    else
      url "https://github.com/rvben/vership/releases/download/v0.5.29/vership-v0.5.29-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "87a2f575b5fd001abb5296a7af79c745e425d9ca93ce1fe259255121afe03ffb"
    end
  end

  def install
    bin.install "vership"
  end

  test do
    system "#{bin}/vership", "--version"
  end
end
