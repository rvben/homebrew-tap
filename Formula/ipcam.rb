class Ipcam < Formula
  desc "A CLI for managing IP cameras (Tapo, Reolink) via RTSP and vendor APIs"
  homepage "https://github.com/rvben/ipcam"
  version "0.0.11"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/ipcam/releases/download/v#{version}/ipcam-macos-aarch64"
      sha256 "a3b1695f1d61ea1cbad7e7aa96c59e7a3ad583dde8391c74c6a04e30e2c80e1a"
    else
      url "https://github.com/rvben/ipcam/releases/download/v#{version}/ipcam-macos-x86_64"
      sha256 "46f9ff69ece4276b2e320a1fd6c81153d4f07f7472c9adf4e8d939190c86d76c"
    end
  end

  on_linux do
    url "https://github.com/rvben/ipcam/releases/download/v#{version}/ipcam-linux-x86_64"
    sha256 "62d4fbb5777d34566c3afc427c304cf6aa4bd9a2bda8c542f4f91ef064c93661"
  end

  def install
    binary = Dir["ipcam-*"].first
    bin.install binary => "ipcam"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ipcam --version")
  end
end
