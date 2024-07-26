const addEqualsFour = require('./addEqualsFour');

test('addEqualsFour returns true for (1, 3)', () => {
  expect(addEqualsFour(1, 3)).toBe(true);
});

test('addEqualsFour returns false for (2, 3)', () => {
  expect(addEqualsFour(2, 3)).toBe(false);
});

test('addEqualsFour returns true for (2, 2)', () => {
  expect(addEqualsFour(2, 2)).toBe(true);
});

test('addEqualsFour returns false for (1, 2)', () => {
  expect(addEqualsFour(1, 2)).toBe(false);
});

test('addEqualsFour returns true for (0, 4)', () => {
  expect(addEqualsFour(0, 4)).toBe(true);
});

