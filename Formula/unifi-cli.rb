class UnifiCli < Formula
  desc "CLI for UniFi Network controllers"
  homepage "https://github.com/rvben/unifi-cli"
  version "0.4.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/unifi-cli/releases/download/v0.4.5/unifi-cli-v0.4.5-aarch64-apple-darwin.tar.gz"
      sha256 "6da9c46cfdc36b0550d9240eb939293bdd4d6841c9c8d5dcbd74503f4eab1e31"
    else
      url "https://github.com/rvben/unifi-cli/releases/download/v0.4.5/unifi-cli-v0.4.5-x86_64-apple-darwin.tar.gz"
      sha256 "450bd807eb08e1850a7b085f7ddc57be758ad84741f027a013948223c2012ed3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/unifi-cli/releases/download/v0.4.5/unifi-cli-v0.4.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3f2ac6785a60a70ec5cfe92d376ff934d2a1efaabfc42c63d14fabdefefd384e"
    else
      url "https://github.com/rvben/unifi-cli/releases/download/v0.4.5/unifi-cli-v0.4.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0c58ce7e860dd465deabe43073330dd0da06d072b984973b23099184604048a9"
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
