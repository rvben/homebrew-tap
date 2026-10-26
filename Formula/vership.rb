class Vership < Formula
  desc "Multi-target release orchestrator"
  homepage "https://github.com/rvben/vership"
  version "0.5.30"
  license "MIT"
  revision 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/vership/releases/download/v0.5.30/vership-v0.5.30-aarch64-apple-darwin.tar.gz"
      sha256 "930c394115c3fbbc49b9b769003ff38ec71ac2e3cbd4faa1c5b02d947e9aad3d"
    else
      url "https://github.com/rvben/vership/releases/download/v0.5.30/vership-v0.5.30-x86_64-apple-darwin.tar.gz"
      sha256 "8f896fd6b0872e63f78b82f4af9cf3d2aaddb2e357b0d6b4aeeb4ca217210cf9"
    end
  end

  on_linux do
    depends_on "rust" => :build

    on_arm do
      url "https://static.crates.io/crates/vership/vership-0.5.30.crate"
      sha256 "6419e40e9e2fc7263861ed7256f0d07e10034c289601248c527b8964ccb59f48"
    end
    on_intel do
      url "https://static.crates.io/crates/vership/vership-0.5.30.crate"
      sha256 "6419e40e9e2fc7263861ed7256f0d07e10034c289601248c527b8964ccb59f48"
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
