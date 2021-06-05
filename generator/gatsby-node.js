const puppeteer = require('puppeteer')
const fs = require('fs')
const path = require('path');
const shell = require('child_process').execSync ; 
const Constants  = require ("./gatsby-constants" );

if (Constants.DATA_PATH){

    const pdfConfig = require(path.resolve(Constants.DATA_PATH, "contact.json"))
    const PDF_PATH = path.resolve(Constants.DATA_PATH, pdfConfig.pdfUrf)
    console.log(PDF_PATH)

    const initFolder = () => {
        let folderName = require('path').dirname(PDF_PATH)
        shell(`rm -rf ${folderName}`);
        shell(`mkdir -p ${folderName}`);
    };

    const generateAssets = () => {
        const src= path.resolve(Constants.DATA_PATH);
        const des= path.resolve(Constants.FRONTEND_PATH);
        
        shell(`rm -rf ${des}`);
        shell(`mkdir -p ${src}`);
        shell(`cp -rf ${src}/ ${des}`);

        console.log(`Data generated at ${des}`)
    }


    const createPDF = async () => {
        const browser = await puppeteer.launch({
          executablePath: process.env.CHROME_BIN || null,
          args: ['--no-sandbox', '--headless', '--disable-gpu']
        });
        try {
            const page = await browser.newPage();

            await page.goto(Constants.TEMPLATE_URL, {
                waitUntil: 'networkidle2',
            });

            console.log(`Cretating pdf CONFIG_PDF=${Constants.CONFIG_PDF} at ${PDF_PATH}`)
            fs.writeFileSync(PDF_PATH, await page.pdf({
                printBackground: true,
                format: 'A4',
                // pageRanges: "1,3,5"
            }));
            

            generateAssets()

            process.exit(0)
        } catch (e) {
            await browser.close();        
        } finally {
            await browser.close();
        }
    };


    exports.onPostBootstrap = async function ({ cache, store, graphql }, { query }) {
        initFolder()
        setInterval(() => createPDF(), 1000)
    }
}
