class UnifiCli < Formula
  desc "CLI for UniFi Network controllers"
  homepage "https://github.com/rvben/unifi-cli"
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/unifi-cli/releases/download/v0.5.0/unifi-cli-v0.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "7a5b7ff8deaf22406ec7d637204e7246706e034aa058c22a50dacf48bb171503"
    else
      url "https://github.com/rvben/unifi-cli/releases/download/v0.5.0/unifi-cli-v0.5.0-x86_64-apple-darwin.tar.gz"
      sha256 "905ee75a15395418df6e02d554db60d59f6e2772dea598ae4e853e6e86387269"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/unifi-cli/releases/download/v0.5.0/unifi-cli-v0.5.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2cc645804d615df75295f2099dbcc5b644920e7c073ae833f73a92a84b12fd90"
    else
      url "https://github.com/rvben/unifi-cli/releases/download/v0.5.0/unifi-cli-v0.5.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "62460ef766c09a934baaeba0ccb9ac59d0faa7b1c406fe9cb2c793516a4b7d91"
    end
  end

  def install
    bin.install "unifi", "unifi-cli"
    generate_completions_from_executable(bin/"unifi", "completions")
  end

  test do
    %w[unifi unifi-cli].each do |command|
      assert_match version.to_s, shell_output("#{bin}/#{command} --version")
      system "#{bin}/#{command}", "--help"
    end
  end
end
