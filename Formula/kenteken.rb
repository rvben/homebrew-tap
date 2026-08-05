class Kenteken < Formula
  desc "Look up Dutch vehicle data by licence plate from the RDW open data API"
  homepage "https://github.com/rvben/kenteken"
  version "0.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/kenteken/releases/download/v0.2.1/kenteken-v0.2.1-aarch64-apple-darwin.tar.gz"
      sha256 "257589ee38286777911aa7a7bda47c29399a3566eb182a8d77f49c4298f6d38b"
    else
      url "https://github.com/rvben/kenteken/releases/download/v0.2.1/kenteken-v0.2.1-x86_64-apple-darwin.tar.gz"
      sha256 "0211f00763e7e28bda51a1e4166fefdaed380f34c39bb16ae9a7ea8e26c5a083"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/kenteken/releases/download/v0.2.1/kenteken-v0.2.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "507196da6699b377f0774d41ab781581df9dff5f2a137e86d8e9153d116fdd97"
    else
      url "https://github.com/rvben/kenteken/releases/download/v0.2.1/kenteken-v0.2.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a15b8ce9c24c0ec9842cde397c91bc625df7a36e9d58d2929205749574dd9785"
    end
  end

  def install
    bin.install "kenteken"
  end

  test do
    system "#{bin}/kenteken", "--version"
  end
end
