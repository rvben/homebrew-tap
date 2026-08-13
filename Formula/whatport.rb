class Whatport < Formula
  desc "Find what process is listening on a TCP/UDP port, and free it"
  homepage "https://github.com/rvben/whatport"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/whatport/releases/download/v0.1.1/whatport-v0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "f49404bf0f88f8ecad1ce766d0f89943ce2e9d718fdcfa6133899fd6ead8730e"
    else
      url "https://github.com/rvben/whatport/releases/download/v0.1.1/whatport-v0.1.1-x86_64-apple-darwin.tar.gz"
      sha256 "a17503907aa8a87d5deeb269bf3af9e972a96a76323b0d1d371d93785327d1f8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/whatport/releases/download/v0.1.1/whatport-v0.1.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6af781579510f7f90c18a62acec2dae84a20ac5b423c0a9117fe1d9cd008c384"
    else
      url "https://github.com/rvben/whatport/releases/download/v0.1.1/whatport-v0.1.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f5b6a48f70e693cd322e36bb6ef196733e9a6be1f6e6fda92ca08ebb821b8e83"
    end
  end

  def install
    bin.install "whatport"
  end

  test do
    system "#{bin}/whatport", "--version"
  end
end
