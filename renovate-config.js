module.exports = {
  branchPrefix: 'selfhost-renovate/',
  dryRun: true,
  gitAuthor: 'Renovate Bot <bot@renovateapp.com>',
  logLevel: 'debug',
  onboarding: false,
  platform: 'github',
  includeForks: true,
  repositories: [
      'swfz/github-actions-playground'
    ],
  packageRules: [
    {
      managers: ["github-actions"],
      enabled: true
    },
      {
            description: 'lockFileMaintenance',
            updateTypes: [
                    'pin',
                    'digest',
                    'patch',
                    'minor',
                    'major',
                    'lockFileMaintenance',
                  ],
            masterIssueApproval: false,
            stabilityDays: 0,
          },
    ],
};
