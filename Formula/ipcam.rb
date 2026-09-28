class Ipcam < Formula
  desc "A CLI for managing IP cameras (Tapo, Reolink) via RTSP and vendor APIs"
  homepage "https://github.com/rvben/ipcam"
  version "0.0.12"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/ipcam/releases/download/v#{version}/ipcam-macos-aarch64"
      sha256 "0fd13c80092bc67f2f08a5e07471543bc335090176ec3b0b60bc0146c7e8c921"
    else
      url "https://github.com/rvben/ipcam/releases/download/v#{version}/ipcam-macos-x86_64"
      sha256 "f1939d90959c86faab640ef238b634ecd9782b0c37508a30735b32afedd9a1bc"
    end
  end

  on_linux do
    url "https://github.com/rvben/ipcam/releases/download/v#{version}/ipcam-linux-x86_64"
    sha256 "b149121a9e200d2ac715125b2c261db62773b9889a5d1259affadb1b04f6002b"
  end

  def install
    binary = Dir["ipcam-*"].first
    bin.install binary => "ipcam"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ipcam --version")
  end
end
