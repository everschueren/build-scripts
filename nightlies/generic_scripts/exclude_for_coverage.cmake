## general purpose nightly testing script for OpenMS
CMAKE_MINIMUM_REQUIRED (VERSION 2.6)

SET(CTEST_CUSTOM_TESTS_IGNORE
  ${CTEST_CUSTOM_TESTS_IGNORE}
  # ignore all out file comparison tests
  TOPP_WSDL_1_out1
  TOPP_AdditiveSeries_1_out1
  TOPP_AdditiveSeries_1_out2
  TOPP_AdditiveSeries_1_out3
  TOPP_AdditiveSeries_1_out4
  TOPP_IDMerger_1_out1
  TOPP_IDMerger_2_out1
  TOPP_IDMerger_3_out1
  TOPP_IDMerger_4_out1
  TOPP_BaselineFilter_1_out1
  TOPP_ConsensusMapNormalizer_1_out1
  TOPP_MapNormalizer_1_out1
  TOPP_Decharger_1_out1
  TOPP_DTAExtractor_1_out1
  TOPP_DTAExtractor_2_out1
  TOPP_DTAExtractor_3_out1
  TOPP_MassTraceExtractor_1_out
  TOPP_FeatureFinderCentroided_1_out1
  TOPP_FeatureFinderMRM_1_out1
  TOPP_FileConverter_1_out1
  TOPP_FileConverter_2_out1
  TOPP_FileConverter_3_out1
  TOPP_FileConverter_4_out1
  TOPP_FileConverter_6_out1
  TOPP_FileConverter_7_out1
  TOPP_FileConverter_8_out1
  TOPP_FileConverter_9_out1
  TOPP_FileConverter_10_out1
  TOPP_FileConverter_11_out1
  TOPP_FileConverter_12_out1
  TOPP_FileConverter_13_out1
  TOPP_FileConverter_14_out1
  TOPP_FileConverter_15_out1
  TOPP_FileConverter_16_out1
  TOPP_FileFilter_1_out1
  TOPP_FileFilter_2_out1
  TOPP_FileFilter_3_out1
  TOPP_FileFilter_4_out1
  TOPP_FileFilter_5_out1
  TOPP_FileFilter_6_out1
  TOPP_FileFilter_7_out1
  TOPP_FileFilter_8_out1
  TOPP_FileFilter_9_out1
  TOPP_FileFilter_10_out1
  TOPP_FileFilter_11_out1
  TOPP_FileFilter_12_out1
  TOPP_FileFilter_13_out1
  TOPP_FileFilter_14_out1
  TOPP_FileFilter_15_out1
  TOPP_FileFilter_16_out1
  TOPP_FileFilter_17_out1
  TOPP_FileFilter_18_out1
  TOPP_FileFilter_19_out1
  TOPP_FileFilter_20_out1
  TOPP_FileFilter_21_out1
  TOPP_FileFilter_22_out1
  TOPP_FileFilter_23_out1
  TOPP_FileFilter_24_out1
  TOPP_FileInfo_1_out1
  TOPP_FileInfo_2_out1
  TOPP_FileInfo_3_out1
  TOPP_FileInfo_4_out1
  TOPP_FileInfo_5_out1
  TOPP_FileInfo_6_out1
  TOPP_FileInfo_7_out1
  TOPP_FileInfo_9_out1
  TOPP_FileMerger_1_out1
  TOPP_FileMerger_2_out1
  TOPP_FileMerger_3_out1
  TOPP_FileMerger_4_out1
  TOPP_FileMerger_5_out1
  TOPP_FileMerger_6_out1
  TOPP_FileMerger_7_out1
  TOPP_IDRTCalibration_1_out1
  TOPP_IDRTCalibration_2_out1
  TOPP_ITRAQAnalyzer_1_out1
  TOPP_ITRAQAnalyzer_2_out1
  TOPP_IDConflictResolver_1_out1
  TOPP_IDConflictResolver_2_out1
  TOPP_IDFileConverter_1_out1
  TOPP_IDFileConverter_2_out1
  TOPP_IDFileConverter_3_out1
  TOPP_IDFileConverter_4_out1
  TOPP_IDFilter_1_out1
  TOPP_IDFilter_2_out1
  TOPP_IDFilter_3_out1
  TOPP_IDFilter_4_out1
  TOPP_IDFilter_5_out1
  TOPP_IDFilter_6_out1
  TOPP_IDFilter_7_out1
  TOPP_MapAlignerPoseClustering_1_out1
  TOPP_MapAlignerPoseClustering_1_out2
  TOPP_MapAlignerPoseClustering_1_out3
  TOPP_MapAlignerPoseClustering_1_out4
  TOPP_MapAlignerPoseClustering_1_out5
  TOPP_MapAlignerPoseClustering_1_out6
  TOPP_MapAlignerPoseClustering_2_out1
  TOPP_MapAlignerPoseClustering_2_out2
  TOPP_MapAlignerPoseClustering_2_out3
  TOPP_MapAlignerPoseClustering_3_out1
  TOPP_MapAlignerPoseClustering_3_out2
  TOPP_MapAlignerPoseClustering_4_out1
  TOPP_MapAlignerPoseClustering_4_out2
  TOPP_MapAlignerIdentification_1_out1
  TOPP_MapAlignerIdentification_1_out2
  TOPP_MapAlignerIdentification_2_out1
  TOPP_MapAlignerIdentification_3_out1
  TOPP_MapAlignerIdentification_3_out2
  TOPP_MapAlignerIdentification_4_out1
  TOPP_MapAlignerIdentification_4_out2
  TOPP_MapAlignerIdentification_5_out1
  TOPP_MapAlignerIdentification_5_out2
  TOPP_MapAlignerSpectrum_1_out1
  TOPP_MapAlignerSpectrum_1_out2
  TOPP_MapAlignerSpectrum_1_out3
  TOPP_MapRTTransformer_1_out1
  TOPP_MapRTTransformer_1_out2
  TOPP_MapRTTransformer_2_out1
  TOPP_MapRTTransformer_3_out1
  TOPP_MascotAdapter_1_out1
  TOPP_MascotAdapter_2_out1
  TOPP_NoiseFilterGaussian_1_out1
  TOPP_NoiseFilterSGolay_1_out1
  TOPP_PeakPickerWavelet_1_out1
  TOPP_PeakPickerWavelet_2_out1
  TOPP_PeakPickerWavelet_3_out1
  TOPP_PeakPickerWavelet_4_out1
  TOPP_PeakPickerWavelet_5_out1
  TOPP_PeakPickerHiRes_1_out1
  TOPP_Resampler_1_out1
  TOPP_RTModel_1_out1
  TOPP_RTModel_2_out1
  TOPP_RTModel_2_out2
  TOPP_RTModel_2_out3
  TOPP_RTModel_3_out1
  TOPP_RTModel_3_out2
  TOPP_RTModel_4_out1
  TOPP_RTModel_4_out2
  TOPP_PTModel_1_out1
  TOPP_PTModel_1_out2
  TOPP_PTModel_1_out3
  TOPP_PTPredict_1_out1
  TOPP_RTPredict_1_out1
  TOPP_RTPredict_2_out1
  TOPP_RTPredict_2_out2
  TOPP_RTPredict_3_out1
  TOPP_RTPredict_4_out1
  TOPP_RTPredict_5_out1
  TOPP_InspectAdapter_1_out1
  TOPP_InspectAdapter_2_out1
  TOPP_SeedListGenerator_1_out1
  TOPP_SeedListGenerator_2_out1
  TOPP_SeedListGenerator_3_out1
  TOPP_SeedListGenerator_3_out2
  TOPP_SpectraFilterSqrtMower_1_out1
  TOPP_SpectraFilterWindowMower_1_out1
  TOPP_SpectraFilterWindowMower_2_out1
  TOPP_TextExporter_1_out1
  TOPP_TextExporter_2_out1
  TOPP_TextExporter_2_out2
  TOPP_TextExporter_2_out3
  TOPP_TextExporter_2_out4
  TOPP_TextExporter_3_out1
  TOPP_TextExporter_4_out1
  TOPP_TextExporter_5_out1
  TOPP_TextExporter_6_out1
  TOPP_TextExporter_7_out1
  TOPP_TextExporter_8_out1
  TOPP_SILACAnalyzer_1_out1
  TOPP_SILACAnalyzer_1_out2
  TOPP_SILACAnalyzer_3_out1
  TOPP_FeatureFinderRaw_1_out
  TOPP_FeatureLinkerLabeled_1_out1
  TOPP_FeatureLinkerLabeled_2_out1
  TOPP_FeatureLinkerUnlabeled_1_out1
  TOPP_FeatureLinkerUnlabeled_2_out1
  TOPP_FeatureLinkerUnlabeled_3_out1
  TOPP_FeatureLinkerUnlabeled_4_out1
  TOPP_FeatureLinkerUnlabeledQT_1_out1
  TOPP_FeatureLinkerUnlabeledQT_2_out1
  TOPP_IDMapper_1_out1
  TOPP_IDMapper_2_out1
  TOPP_IDMapper_3_out1
  TOPP_ConsensusID_1_out1
  TOPP_ConsensusID_2_out1
  TOPP_ConsensusID_3_out1
  TOPP_PrecursorIonSelector_1_out1
  TOPP_PrecursorIonSelector_2_out1
  TOPP_CompNovo_1_out1
  TOPP_CompNovoCID_1_out1
  TOPP_PrecursorMassCorrector_1_out1
  TOPP_ProteinInference_1_out1
  TOPP_FalseDiscoveryRate_1_out1
  TOPP_FalseDiscoveryRate_2_out1
  TOPP_FalseDiscoveryRate_3_out1
  TOPP_FalseDiscoveryRate_4_out1
  TOPP_IDPosteriorErrorProbability_1_out1
  TOPP_IDPosteriorErrorProbability_2_out1
  TOPP_IDPosteriorErrorProbability_3_out1
  TOPP_IDPosteriorErrorProbability_4_out1
  TOPP_IDPosteriorErrorProbability_5_out1
  TOPP_IDPosteriorErrorProbability_6_out1
  TOPP_ProteinQuantifier_1_out1
  TOPP_ProteinQuantifier_1_out2
  TOPP_ProteinQuantifier_2_out1
  TOPP_ProteinQuantifier_2_out2
  TOPP_ProteinQuantifier_3_out1
  TOPP_ProteinQuantifier_3_out2
  TOPP_ProteinQuantifier_4_out1
  TOPP_ProteinQuantifier_5_out1
  TOPP_ProteinQuantifier_6_out1
  TOPP_ProteinQuantifier_7_out1
  TOPP_ProteinQuantifier_8_out1
  TOPP_ProteinQuantifier_9_out1
  TOPP_ProteinQuantifier_10_out1
  TOPP_ProteinQuantifier_11_out1
  TOPP_InclusionExclusionListCreator_1_out1
  TOPP_InclusionExclusionListCreator_2_out1
  TOPP_InclusionExclusionListCreator_3_out1
  TOPP_InclusionExclusionListCreator_4_out1
  TOPP_InclusionExclusionListCreator_5_out1
  TOPP_InclusionExclusionListCreator_6_out1
  TOPP_PeptideIndexer_1_out
  TOPP_PeptideIndexer_2_out
  TOPP_PeptideIndexer_3_out
  TOPP_PeptideIndexer_4_out
  UTILS_ImageCreator_1_out1
  UTILS_ImageCreator_2_out1
  UTILS_IDSplitter_1_out1
  UTILS_IDSplitter_1_out2
  UTILS_MassCalculator_1_out1
  UTILS_MassCalculator_2_out1
  UTILS_INIUpdater_1_out
  UTILS_INIUpdater_3_out
  # and the section name tests
  TOPPWRITEINI_AdditiveSeries_SectionName
  TOPPWRITEINI_BaselineFilter_SectionName
  TOPPWRITEINI_CompNovo_SectionName
  TOPPWRITEINI_CompNovoCID_SectionName
  TOPPWRITEINI_ConsensusID_SectionName
  TOPPWRITEINI_ConsensusMapNormalizer_SectionName
  TOPPWRITEINI_DBExporter_SectionName
  TOPPWRITEINI_DBImporter_SectionName
  TOPPWRITEINI_DTAExtractor_SectionName
  TOPPWRITEINI_Decharger_SectionName
  TOPPWRITEINI_EICExtractor_SectionName
  TOPPWRITEINI_ExecutePipeline_SectionName
  TOPPWRITEINI_FalseDiscoveryRate_SectionName
  TOPPWRITEINI_FeatureFinderMRM_SectionName
  TOPPWRITEINI_FeatureFinderCentroided_SectionName
  TOPPWRITEINI_FeatureFinderIsotopeWavelet_SectionName
  TOPPWRITEINI_FeatureFinderMetabo_SectionName
  TOPPWRITEINI_FeatureFinderRaw_SectionName
  TOPPWRITEINI_FeatureLinkerLabeled_SectionName
  TOPPWRITEINI_FeatureLinkerUnlabeled_SectionName
  TOPPWRITEINI_FeatureLinkerUnlabeledQT_SectionName
  TOPPWRITEINI_FileConverter_SectionName
  TOPPWRITEINI_FileFilter_SectionName
  TOPPWRITEINI_FileInfo_SectionName
  TOPPWRITEINI_FileMerger_SectionName
  TOPPWRITEINI_HighResPrecursorMassCorrector_SectionName
  TOPPWRITEINI_IDConflictResolver_SectionName
  TOPPWRITEINI_IDPosteriorErrorProbability_SectionName
  TOPPWRITEINI_IDFileConverter_SectionName
  TOPPWRITEINI_IDFilter_SectionName
  TOPPWRITEINI_IDMapper_SectionName
  TOPPWRITEINI_IDMerger_SectionName
  TOPPWRITEINI_IDRTCalibration_SectionName
  TOPPWRITEINI_ITRAQAnalyzer_SectionName
  TOPPWRITEINI_InspectAdapter_SectionName
  TOPPWRITEINI_InternalCalibration_SectionName
  TOPPWRITEINI_MapAlignerIdentification_SectionName
  TOPPWRITEINI_MapAlignerPoseClustering_SectionName
  TOPPWRITEINI_MapAlignerSpectrum_SectionName
  TOPPWRITEINI_MapNormalizer_SectionName
  TOPPWRITEINI_MapRTTransformer_SectionName
  TOPPWRITEINI_MapStatistics_SectionName
  TOPPWRITEINI_MascotAdapter_SectionName
  TOPPWRITEINI_MascotAdapterOnline_SectionName
  TOPPWRITEINI_MassTraceExtractor_SectionName
  TOPPWRITEINI_NoiseFilterGaussian_SectionName
  TOPPWRITEINI_NoiseFilterSGolay_SectionName
  TOPPWRITEINI_OMSSAAdapter_SectionName
  TOPPWRITEINI_PhosphoScoring_SectionName
  TOPPWRITEINI_PILISIdentification_SectionName
  TOPPWRITEINI_PILISModelCV_SectionName
  TOPPWRITEINI_PILISModelTrainer_SectionName
  TOPPWRITEINI_PILISSpectraGenerator_SectionName
  TOPPWRITEINI_PTModel_SectionName
  TOPPWRITEINI_PTPredict_SectionName
  TOPPWRITEINI_PeakPickerHiRes_SectionName
  TOPPWRITEINI_PeakPickerWavelet_SectionName
  TOPPWRITEINI_PepNovoAdapter_SectionName
  TOPPWRITEINI_PeptideIndexer_SectionName
  TOPPWRITEINI_PrecursorIonSelector_SectionName
  TOPPWRITEINI_PrecursorMassCorrector_SectionName
  TOPPWRITEINI_ProteinInference_SectionName
  TOPPWRITEINI_ProteinQuantifier_SectionName
  TOPPWRITEINI_RTModel_SectionName
  TOPPWRITEINI_RTPredict_SectionName
  TOPPWRITEINI_Resampler_SectionName
  TOPPWRITEINI_SILACAnalyzer_SectionName
  TOPPWRITEINI_SeedListGenerator_SectionName
  TOPPWRITEINI_SpecLibSearcher_SectionName
  TOPPWRITEINI_SpectraFilterWindowMower_SectionName
  TOPPWRITEINI_SpectraFilterThresholdMower_SectionName
  TOPPWRITEINI_SpectraFilterSqrtMower_SectionName
  TOPPWRITEINI_SpectraFilterParentPeakMower_SectionName
  TOPPWRITEINI_SpectraFilterMarkerMower_SectionName
  TOPPWRITEINI_SpectraFilterScaler_SectionName
  TOPPWRITEINI_SpectraFilterBernNorm_SectionName
  TOPPWRITEINI_SpectraFilterNLargest_SectionName
  TOPPWRITEINI_SpectraFilterNormalizer_SectionName
  TOPPWRITEINI_TOFCalibration_SectionName
  TOPPWRITEINI_TextExporter_SectionName
  TOPPWRITEINI_MzTabExporter_SectionName
  TOPPWRITEINI_XTandemAdapter_SectionName
  TOPPWRITEINI_InclusionExclusionListCreator_SectionName
  TOPPWRITEINI_SpectraMerger_SectionName
)

## regular expression for files that should be excluded from coverage testing
SET(CTEST_CUSTOM_COVERAGE_EXCLUDE "UIC/ui_" "/moc_" )