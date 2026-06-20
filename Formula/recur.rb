class Recur < Formula
  desc "A human-friendly cron job manager"
  homepage "https://github.com/rvben/recur"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/recur/releases/download/v0.1.1/recur-v0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "e30ccaf2ce679264676f1ff6033978292738f9a0e8737fddee90cabd1f561617"
    else
      url "https://github.com/rvben/recur/releases/download/v0.1.1/recur-v0.1.1-x86_64-apple-darwin.tar.gz"
      sha256 "7e329e365c8b0aab409f2c8da592a2ef39f5b893ae291778f1838abf990a020a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/recur/releases/download/v0.1.1/recur-v0.1.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b00f9bbe183f678e5d0a3efc686e5d5360232aca54e32a6deec61ed96e2c80d2"
    else
      url "https://github.com/rvben/recur/releases/download/v0.1.1/recur-v0.1.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "81a76abe680f741e5d2faa1214ceadccf512ab1b9cfb85fc4b242004cb57c2aa"
    end
  end

  def install
    bin.install "recur"
  end

  test do
    system "#{bin}/recur", "--version"
  end
end
