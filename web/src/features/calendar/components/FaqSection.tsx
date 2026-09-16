import type { ReactNode } from "react";

import { cn } from "@/lib/utils";

import {
  Accordion,
  AccordionContent,
  AccordionItem,
  AccordionTrigger,
} from "@/components/ui/accordion";
import {
  SECTION_DESC_CLASS,
  SECTION_HEADING_CLASS,
  SECTION_NARROW_CLASS,
  SECTION_SCROLL_CLASS,
  SITE_SECTIONS,
} from "@/features/calendar/data/site-nav";

const GITHUB_ISSUES_URL = "https://github.com/omergulcicek/takvim/issues/new";

type FaqItem = {
  question: string;
  answer: ReactNode;
};

const FAQ_ITEMS: FaqItem[] = [
  {
    question: "Bu servis ücretsiz mi?",
    answer:
      "Evet, tamamen ücretsizdir. Herhangi bir ödeme, kayıt veya kredi kartı bilgisi gerekmez. Kategorileri seçip abone olmanız yeterlidir.",
  },
  {
    question: "Takvim aboneliği ile .ics dosyası indirmek arasındaki fark nedir?",
    answer:
      "Abonelik, takvim uygulamanızın belirli aralıklarla kaynağı yeniden okumasını sağlar; etkinlikler güncellendiğinde takviminiz de güncellenir. .ics dosyasını indirip yüklemek ise tek seferlik bir içe aktarmadır; sonradan kaynak değişse bile takviminiz otomatik yenilenmez.",
  },
  {
    question: "Google Takvim’de mobil uygulamadan abone olabilir miyim?",
    answer:
      "URL ile takvim ekleme Google Takvim mobil uygulamasında yapılamaz. Bilgisayarda calendar.google.com üzerinden “URL’den abone ol” adımını tamamladıktan sonra takvim telefonunuzdaki Google Takvim uygulamasına senkronize edilir.",
  },
  {
    question: "Abonelik güncellemeleri ne sıklıkta gelir?",
    answer:
      "Takvim uygulamaları abonelikleri kendi aralıklarında yeniler. Güncellemeler genelde birkaç saatte bir gelir; bazen 24 saate kadar sürebilir. Hemen görünmemesi normaldir.",
  },
  {
    question: "Hicri tarihler nasıl hesaplanıyor?",
    answer:
      "Dini günlerde Hicri takvime göre tekrarlayan etkinlikler için Miladi tarihler, Diyanet İşleri Başkanlığı’nın yayımladığı anchor verileriyle eşleştirilir. Diğer kategorilerde Hicri bilgi varsa etkinlik kaydında gösterilir.",
  },
  {
    question: "Neden aradığım kişiyi veya tarihi olayı bulamıyorum?",
    answer:
      "Bu takvimde her şahsiyet veya her tarihî olay yer almıyor. Birçok eski olayda yalnızca yıl bilgisi vardır; ay ve gün net olmadığı için bunları güvenilir biçimde eklemek mümkün olmuyor. Ayrıca Cumhuriyet Bayramı, 23 Nisan gibi millî günler zaten resmî tatil takvimlerinde yer alıyor ve herkesçe bilindiği için burada tekrar etmiyoruz.",
  },
  {
    question: "Yeni etkinlik veya kategori nasıl ekleyebilirim?",
    answer: (
      <>
        Yeni bir etkinlik, kategori veya düzeltme önerisi için{" "}
        <a
          href={GITHUB_ISSUES_URL}
          target="_blank"
          rel="noreferrer"
          className="font-medium text-primary underline-offset-4 transition-opacity duration-150 hover:underline"
        >
          GitHub üzerinden issue açabilirsiniz
        </a>
        . Talebinizi mümkün olduğunca ayrıntılı yazmanız süreci hızlandırır.
      </>
    ),
  },
];

export function FaqSection() {
  return (
    <section id={SITE_SECTIONS.sss} className={cn(SECTION_SCROLL_CLASS, SECTION_NARROW_CLASS)}>
      <h2 className={cn(SECTION_HEADING_CLASS, "text-balance")}>Sıkça sorulan sorular</h2>
      <p className={cn("mt-1.5", SECTION_DESC_CLASS, "text-pretty")}>
        Abonelik, güncelleme ve içerik hakkında sık sorulanlar.
      </p>
      <div className="mt-5 rounded-xl bg-card px-1 shadow-surface">
        <Accordion type="single" collapsible className="w-full">
          {FAQ_ITEMS.map((item) => (
            <AccordionItem key={item.question} value={item.question} className="px-3">
              <AccordionTrigger className="text-left text-sm hover:no-underline">
                {item.question}
              </AccordionTrigger>
              <AccordionContent className="text-pretty text-muted-foreground">
                {item.answer}
              </AccordionContent>
            </AccordionItem>
          ))}
        </Accordion>
      </div>
    </section>
  );
}
