class Kenteken < Formula
  desc "Look up Dutch vehicle data by licence plate from the RDW open data API"
  homepage "https://github.com/rvben/kenteken"
  version "0.2.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/kenteken/releases/download/v0.2.6/kenteken-v0.2.6-aarch64-apple-darwin.tar.gz"
      sha256 "7479ac422bb60c378209f4653367ab281e14d077bd800ed18e6fc1d75f61c99d"
    else
      url "https://github.com/rvben/kenteken/releases/download/v0.2.6/kenteken-v0.2.6-x86_64-apple-darwin.tar.gz"
      sha256 "e1cfcb2163414b926bc7d8e3fa38dc07337fe8fc8351e117366f38f97da732de"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/kenteken/releases/download/v0.2.6/kenteken-v0.2.6-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7e03d8c24d91a89ccceb1dca4fb6c5ddf6a25cfa360472f7a35e9e43dfaa83f1"
    else
      url "https://github.com/rvben/kenteken/releases/download/v0.2.6/kenteken-v0.2.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "189f1c4245e885c8f1d73c16257a094ba800f2657ef87922c44bbfdda8470dc1"
    end
  end

  def install
    bin.install "kenteken"
  end

  test do
    system "#{bin}/kenteken", "--version"
  end
end
