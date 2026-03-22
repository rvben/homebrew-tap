class Ipcam < Formula
  desc "A CLI for managing IP cameras (Tapo, Reolink) via RTSP and vendor APIs"
  homepage "https://github.com/rvben/ipcam"
  version "0.0.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/ipcam/releases/download/v#{version}/ipcam-macos-aarch64"
      sha256 "1e91e8810d27d3f8635bcf16377858a89bf2e2e6e4e71047188728b9e974dca0"
    else
      url "https://github.com/rvben/ipcam/releases/download/v#{version}/ipcam-macos-x86_64"
      sha256 "e2b246448f7aa89daa0830ddf6d95c1e4f88bb33daa125bcda7608ec816c5359"
    end
  end

  on_linux do
    url "https://github.com/rvben/ipcam/releases/download/v#{version}/ipcam-linux-x86_64"
    sha256 "4dca266f0acf025caf6f6e342f8f244155147e8ea81171db5a735adabd26ed06"
  end

  def install
    binary = Dir["ipcam-*"].first
    bin.install binary => "ipcam"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ipcam --version")
  end
end
