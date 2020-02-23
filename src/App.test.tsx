import React from 'react';
import { render } from '@testing-library/react';
import App from './App';

test('renders namespaces', () => {
  const { getByText } = render(<App />);
  const defaultNamespace = getByText(/default/i);
  expect(defaultNamespace).toBeInTheDocument();
});
