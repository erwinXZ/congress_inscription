<?php

use App\Utils\Pdf;

set_time_limit(3600);

$pdf = new Pdf('Certificados Participantes 1er Congreso Panamericano', 'L');

$pdf->setAutoPageBreak(false);
$pdf->SetFillColor(255, 255, 255);

foreach($participants as $participant){
    $pdf->AddPage();

    $pdf->Image(WWW_ROOT . 'img' . DS . 'certificate.jpg', 0, 0, 279);

    $pdf->SetFont('dejavusans', 'B', 24);

    $pdf->StartTransform();
    $pdf->setTextRenderingMode($stroke=0.25, $fill=true, $clip=false);
    $pdf->SetTextColor(0, 0, 0);
    $pdf->SetDrawColor(255, 255, 255);

    $name = '';
    $name = strstr($participant->occupation, '.', true) ? strstr($participant->occupation, '.', true) . '. ' . $participant->name : $participant->name;

    $pdf->MultiCell('', 12, strtoupper($name), 0, 'L', 0, 0, 70, 90, true, 0, false, true, 12, 'B');

    $pdf->StopTransform();
}

$pdf->Output('certificados.pdf', 'I');
