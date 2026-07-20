class Plugboard < Formula
  desc "Unofficial web dashboard and admin for Tasmota and Shelly smart devices"
  homepage "https://github.com/rvben/plugboard"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/plugboard/releases/download/v0.2.0/plugboard-v0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "7a495e48bdcf779d826d9fc7900508922a97fb676f7e21cb6d2e10c982b41aaa"
    else
      url "https://github.com/rvben/plugboard/releases/download/v0.2.0/plugboard-v0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "081d58969a3177e0281ab53fccfd07d75732e574abd5b4a7bd6296cdfb9a68e1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/plugboard/releases/download/v0.2.0/plugboard-v0.2.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0fedc3b94e83d5acf78c0c017cdacda7ef3a42ac35e7f02ce04c41d2eb52e957"
    else
      url "https://github.com/rvben/plugboard/releases/download/v0.2.0/plugboard-v0.2.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e61190755a56b0b515acff23fabde1b342c8cfa1e68feb35227d9a8b637db062"
    end
  end

  def install
    bin.install "plugboard"
  end

  test do
    system "#{bin}/plugboard", "--version"
  end
end
