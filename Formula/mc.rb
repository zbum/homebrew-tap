class Mc < Formula
  desc "SSH connection manager"
  homepage "https://github.com/zbum/mc"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/zbum/mc/releases/download/v1.3.0/mc-v1.3.0-darwin-arm64"
      sha256 "384ced1300435156387827dab16e19859539f9c545f2a59e42e2c065ddd36d06"

    elsif Hardware::CPU.intel?
      url "https://github.com/zbum/mc/releases/download/v1.3.0/mc-v1.3.0-darwin-amd64"
      sha256 "645e1c377664e63e4bfa137be3eb9f4f39ba2cea3ff69fa55638cdfb7ae56b09"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/zbum/mc/releases/download/v1.3.0/mc-v1.3.0-linux-arm64"
      sha256 "d4781ea139d38da4d1c1b6df51d7d1007cc1e008c902718ee0c750bcb98c3cd1"

    elsif Hardware::CPU.intel?
      url "https://github.com/zbum/mc/releases/download/v1.3.0/mc-v1.3.0-linux-amd64"
      sha256 "498d689d1db8520d147608dd2faa11dabf8989fbca9e62076eae816965f6e331"
    end
  end

  def install
    bin.install Dir["mc-*"].first => "mc"
  end

  test do
    config = testpath/"ssh_config"
    config.write ""
    output = shell_output("MC_SSH_CONFIG=#{config} #{bin}/mc 2>&1", 1)
    assert_match "No SSH hosts found in config", output
  end
end
