class Badgevet < Formula
  desc "Find retired and broken status badges in Markdown that link checkers miss"
  homepage "https://github.com/rvben/badgevet"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/badgevet/releases/download/v0.1.0/badgevet-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "a2cb4cdf2f398cc3455ae8e24000f4a7670eb7ede389e4e3bf24fbec403959a0"
    else
      url "https://github.com/rvben/badgevet/releases/download/v0.1.0/badgevet-v0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "426b7002b20f3132efa8c9ed19fa8b08a56c2fe5141de796c2a3c4f3032e927d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/badgevet/releases/download/v0.1.0/badgevet-v0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5e2498fdb158de76dc2ead8a77ecaea08f071f5d62cfa084f06cef2f3b11e09f"
    else
      url "https://github.com/rvben/badgevet/releases/download/v0.1.0/badgevet-v0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "745a83eff8b36ab9abb7b3ced718862b8d29414bac7088e9e093a6c38d45e0ac"
    end
  end

  def install
    bin.install "badgevet"
  end

  test do
    system "#{bin}/badgevet", "--version"
  end
end
