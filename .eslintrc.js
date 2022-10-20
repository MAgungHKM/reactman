module.exports = {
  extends: [
    'eslint:recommended',
    // 'plugin:@typescript-eslint/eslint-recommended',
    // 'plugin:@typescript-eslint/recommended',
    'next/core-web-vitals',
  ],
  globals: {
    Promise: 'readonly',
    NodeJS: 'readonly',
    NodeListOf: 'readonly',
  },
  rules: {
    curly: 0,
    quotes: 0,
    'no-unused-vars': [
      'error',
      {
        argsIgnorePattern: '^_',
        varsIgnorePattern: '^_',
      },
    ],
    'no-console': 2,
    'react-hooks/exhaustive-deps': 0,
  },
};
