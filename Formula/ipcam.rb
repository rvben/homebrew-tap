class Ipcam < Formula
  desc "A CLI for managing IP cameras (Tapo, Reolink) via RTSP and vendor APIs"
  homepage "https://github.com/rvben/ipcam"
  version "0.0.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/ipcam/releases/download/v#{version}/ipcam-macos-aarch64"
      sha256 "16b54bbda8cdbac8821c865ed336638467a74d6bc9ebd1f07158b2d97d2d3fba"
    else
      url "https://github.com/rvben/ipcam/releases/download/v#{version}/ipcam-macos-x86_64"
      sha256 "6e18b84e75affa07b10668d601dd15297d49a1ce7bdc004c89621de4ce6b1696"
    end
  end

  on_linux do
    url "https://github.com/rvben/ipcam/releases/download/v#{version}/ipcam-linux-x86_64"
    sha256 "08ba824d85eaa4a10ff95bb7c3bbc51bcf6c36910a050471739bbe956be89ced"
  end

  def install
    binary = Dir["ipcam-*"].first
    bin.install binary => "ipcam"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ipcam --version")
  end
end
