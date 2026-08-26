class Ipcam < Formula
  desc "A CLI for managing IP cameras (Tapo, Reolink) via RTSP and vendor APIs"
  homepage "https://github.com/rvben/ipcam"
  version "0.0.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/ipcam/releases/download/v#{version}/ipcam-macos-aarch64"
      sha256 "6ba59e125f19e7875c71b4919eb4932e3fdbdf260ab7729b06e1f4c9dce39afe"
    else
      url "https://github.com/rvben/ipcam/releases/download/v#{version}/ipcam-macos-x86_64"
      sha256 "abe119c271ebdf53859adf40515403a7e97d776484180c0810eef9f02099fe2a"
    end
  end

  on_linux do
    url "https://github.com/rvben/ipcam/releases/download/v#{version}/ipcam-linux-x86_64"
    sha256 "281b322a37967d9249e2840c4d0f7b222b0b001679a243ae7a202f423f7d8da9"
  end

  def install
    binary = Dir["ipcam-*"].first
    bin.install binary => "ipcam"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ipcam --version")
  end
end
