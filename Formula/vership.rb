class Vership < Formula
  desc "Multi-target release orchestrator"
  homepage "https://github.com/rvben/vership"
  version "0.5.32"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/vership/releases/download/v0.5.32/vership-v0.5.32-aarch64-apple-darwin.tar.gz"
      sha256 "0837fb285a2a39c624828fffbce7c99cb74b7bb9ca3ae04f11d150e63234bef4"
    else
      url "https://github.com/rvben/vership/releases/download/v0.5.32/vership-v0.5.32-x86_64-apple-darwin.tar.gz"
      sha256 "2d5b5c88d4e3e4489be980e71bd6e5c75db57628d4375d1d79e9fa5e13c05f07"
    end
  end

  on_linux do
    depends_on "rust" => :build

    on_arm do
      url "https://static.crates.io/crates/vership/vership-0.5.32.crate"
      sha256 "5bad9364b8d8053df738985359d8648ab910bf5b9a328cdedaa54343244a84af"
    end
    on_intel do
      url "https://static.crates.io/crates/vership/vership-0.5.32.crate"
      sha256 "5bad9364b8d8053df738985359d8648ab910bf5b9a328cdedaa54343244a84af"
    end
  end

  def install
    if OS.linux?
      system "cargo", "install", *std_cargo_args, "--bin", "vership"
    else
      bin.install "vership"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/vership --version")
    assert_match "Usage:", shell_output("#{bin}/vership --help")
    assert_equal "vership", JSON.parse(shell_output("#{bin}/vership schema")).fetch("name")
  end
end
