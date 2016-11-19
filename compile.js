const cp = require('child_process')
const path = require('path')

const bsppxPath = './node_modules/bs-platform/bin/bsppx.exe'
const bscPath = './node_modules/bs-platform/bin/bsc.exe'
const selfPackageName = 'self'

function compile (src, out) {
  cp.execSync(`rm -rf ${out}`)

  const selfOut = path.join(out, selfPackageName)
  cp.execSync(`mkdir -p ${selfOut}`)

  const sortedFiles = cp.execSync(`ocamldep -ppx ${bsppxPath} -sort ${src}/*.ml`, {encoding: 'utf8'})
    .trim()
    .split(' ')
  for (const file of sortedFiles) {
    const destination = file.replace('src', selfOut).replace(/.ml$/, '')
    cp.execSync(`${bscPath} -g -bin-annot -bs-package-name ${selfPackageName} -bs-package-output commonjs:${selfOut} -I ${selfOut} -o ${destination} -c -impl ${file}`)
  }
}

compile('src', '_build')
